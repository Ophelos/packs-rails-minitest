namespace :packs do
  task test: "test:prepare" do
    ENV["DEFAULT_TEST"] = "{#{Packs.all.map(&:name).join(",")}}/test/**/*_test.rb"
    ENV["DEFAULT_TEST_EXCLUDE"] = "{#{Packs.all.map(&:name).join(",")}}/test/{system,dummy}/**/*_test.rb"
    system("rails", "test")
  end

  namespace :test do
    multitask prepare: Packs.all.map { |pack| "#{pack.name}:prepare" }

    task all: :prepare do
      system("rails", "test", *Packs.all.map { |pack| pack.relative_path.join("test/**/*_test.rb").to_s })
    end

    task system: :prepare do
      system("rails", "test", *Packs.all.map { |pack| pack.relative_path.join("test/system/**/*_test.rb").to_s })
    end

    Packs.all.each do |pack|
      task pack.name => "#{pack.name}:prepare" do
        ENV["DEFAULT_TEST"] = pack.relative_path.join("test/**/*_test.rb").to_s
        ENV["DEFAULT_TEST_EXCLUDE"] = pack.relative_path.join("test/{system,dummy}/**/*_test.rb").to_s
        system("rails", "test")
      end

      namespace pack.name do
        multitask :prepare

        task all: :prepare do
          system("rails", "test", pack.relative_path.join("test/**/*_test.rb").to_s)
        end

        task system: :prepare do
          system("rails", "test", pack.relative_path.join("test/system/**/*_test.rb").to_s)
        end
      end
    end
  end
end
