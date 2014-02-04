require 'rake'
require 'yaml'
require 'colored'
require 'fileutils'

def load_kitchen
	YAML.load_file(".kitchen.yml")
end

def save_kitchen(conf)
	File.open(".kitchen.yml", "w") do |f|
		f << conf.to_yaml
	end
end

def create_recipe(recipe_name)
	prefix = if File.exists?("recipes/#{recipe_name}.rb")
		"[exists]  ".yellow 
	else
		File.open("recipes/#{recipe_name}.rb", "w") do |file|
			file << "#  Recipe for installing/configuring #{recipe_name}"
		end
		"[create]  ".green
	end
	puts "#{prefix}recipes/#{recipe_name}.rb"
end

def create_attributes(recipe_name)
	prefix = if File.exists?("attributes/#{recipe_name}.rb")
		"[exists]  ".yellow 
	else
		File.open("attributes/#{recipe_name}.rb", "w") do |file|
			file << "default['#{recipe_name}'] = nil"
		end
		"[create]  ".green
	end
	puts "#{prefix}attributes/#{recipe_name}.rb"
end
def create_spec(recipe_name)
	prefix = if File.exists?("test/integration/default/serverspec/#{recipe_name}_spec.rb") 
		"[exists]  ".yellow 
	else
		File.open("test/integration/default/serverspec/#{recipe_name}_spec.rb", "w") do |file|
			file << "
require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

# RSpec.configure do |c|
# 	c.before :all do
# 		c.path = \"/sbin:/usr/sbin\"
# 	end
# end

# Documentation for writing tests can be found at:
#  http://serverspec.org/
describe \"#{recipe_name}\" do
	it 'is a failing test' do
		expect(file('#{recipe_name}')).to be_file
	end
end
"
		end
		"[create]  ".green
	end
	puts "#{prefix}test/integration/default/serverspec/#{recipe_name}_spec.rb\n"
end
	

namespace :uw do |variable|

	desc "Test a specific recipe"
	task :test, :recipe_name do |t, args|
		begin
			recipe_name = args.to_hash.fetch(:recipe_name)
		rescue KeyError
			abort("[failed]  ".red + "No recipe name specified") if recipe_name.nil?
		end

		default_kitchen = load_kitchen
		begin
			test_kitchen = default_kitchen.dup
			test_kitchen['suites'] = default_kitchen['suites'].dup
			suite = {
				'name' => recipe_name,
				'run_list' => ['ubuntu-workstation::default', "ubuntu-workstation::#{recipe_name}"],
				'attributes' => {
					'workstation_user' => "vagrant"
				}
			}
			test_kitchen['suites'] << suite
			save_kitchen(test_kitchen)

			FileUtils.mkdir_p("test/integration/#{recipe_name}/serverspec")
			FileUtils.ln_s(File.expand_path("test/integration/default/serverspec/#{recipe_name}_spec.rb"),
						   "test/integration/#{recipe_name}/serverspec/#{recipe_name}_spec.rb"	)


			system("kitchen test #{recipe_name}")
		ensure
			puts default_kitchen.inspect
			save_kitchen(default_kitchen)
			FileUtils.rm_rf("test/integration/#{recipe_name}")
		end
	end

	desc "Create a new recipe"
	task :create, :recipe_name do |t, args|
		begin
			recipe_name = args.to_hash.fetch(:recipe_name)
		rescue KeyError
			abort("[failed]  ".red + "No recipe name specified") if recipe_name.nil?
		end

		create_recipe  recipe_name
		create_attributes  recipe_name
		create_spec  recipe_name

		
		kitchen = load_kitchen
		#Can we assume default is always first? 
		#  Fairly safe as long as kitchen.yml doesn't get monkeyed with outside of rake tasks.
		kitchen['suites'].first['run_list'] = kitchen['suites'].first['run_list'] | ["recipe[ubuntu-workstation::#{recipe_name}]"]
		save_kitchen(kitchen)
		puts "[update]  ".green + ".kitchen.yml"
	end
end