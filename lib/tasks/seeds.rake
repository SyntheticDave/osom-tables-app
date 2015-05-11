namespace :osom do
  namespace :seeds do
    desc 'Create Dummy Things'
    task :create_things => :environment do
      Thing.destroy_all
      100.times { |i| Thing.create(name: "Thing #{i}", description: "Thing Desc #{i}", size: i) }
    end
  end
end
