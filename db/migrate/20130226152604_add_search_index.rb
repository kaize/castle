class AddSearchIndex < ActiveRecord::Migration
  def up
    sql = <<-SQl
      create index pg_search_documents_index on pg_search_documents using gin(
        to_tsvector('russian', coalesce(content, ''::text)
      ))
    SQl

    execute sql
  end


  def down
    execute "drop index pg_search_documents_index"
  end
end
