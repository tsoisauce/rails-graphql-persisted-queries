class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session
  PersistedQueryNotFound = Class.new(StandardError)

  def execute
    variables = ensure_hash(params[:variables])
    query = persisted_query || params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = RailsGraphqlPersistedQueriesSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue PersistedQueryNotFound
    render json: { errors: [{ message: "PersistedQueryNotFound" }] }
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  def persisted_query
    return if params[:extensions].nil?

    hash = ensure_hash(params[:extensions]).dig("persistedQuery", "sha256Hash")

    return if hash.nil?

    if params[:query]
      store.save_query(hash, params[:query])
      return
    end

    query_str = store.fetch_query(hash)

    raise PersistedQueryNotFound if query_str.nil?

    query_str
  end

  def store
    MemoryStore.instance
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end

class MemoryStore
  def self.instance
    @instance ||= new
  end

  def initialize
    @storage = {}
  end

  def fetch_query(hash)
    @storage[hash]
  end

  def save_query(hash, query)
    @storage[hash] = query
  end
end
