namespace :osom do
  namespace :seeds do
    desc 'Create Dummy All'
    task :create_all => :environment do
      Rake::Task['osom:seeds:create_things'].invoke
      Rake::Task['osom:seeds:create_stuffs'].invoke
    end

    desc 'Create Dummy Things'
    task :create_things => :environment do
      Thing.destroy_all
      100.times { |i| Thing.create(name: "Thing #{i}", description: "Thing Desc #{i}", size: i) }
    end

    desc 'Create Dummy Stuffs'
    task :create_stuffs => :environment do
      Stuff.destroy_all
      100.times { |i| Stuff.create(name: "Stuff #{i}", description: "Stuff Desc #{i}", size: i) }
    end
  end
end
