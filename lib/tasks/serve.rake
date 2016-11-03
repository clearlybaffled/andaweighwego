namespace :serve do
  task :rails do
    sh "rails server -e test"
  end
  task :js do
    sh "gulp serve"
  end
end
multitask :serve => ['serve:rails', 'serve:js']
