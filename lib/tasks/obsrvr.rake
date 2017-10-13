desc "Run observr"
task :observr do
  sh %{bundle exec observr .observr}
end