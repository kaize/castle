namespace :ci do
  task :test => ['db:drop', 'db:create', 'db:migrate', 'ci:setup:minitest', 'rake:test', 'rake:test:lib']
end
