module PgSearcher
  class << self
    def search(query)
      relation = PgSearch::Document.includes(:searchable)
      return relation.search(query) if query.present?
      relation
    end
  end
end