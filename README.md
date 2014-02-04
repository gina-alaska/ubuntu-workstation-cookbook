# ubuntu-workstation cookbook

# Usage
Each recipe corresponds to a specific piece of software(ex: 'vim') that contains the necessary steps for installation and configuration of that package.

# Contributing
Clone this repository and install required gems

```
	git clone https://github.com/gina-alaska/ubuntu-workstation
	bundle install
```

Create a branch with a name like add_recipe_name or fix_recipe_name
```
	git checkout -b add_recipe_name
```

Create a new test, recipe, attributes file and add the recipe to the .kitchen.yml default suite.

```
rake uw:create[recipe_name]
```

###Writing tests:
The directory 'test/integration/default/serverspec' has examples on how to test that packages are installed, files have correct owners and permissions. 

For more detailed documentation see:
[Serverspec](http://serverspec.org)

###Writing recipes:
Look at existing recipes for examples on how to install packages, create directories, set permissions, etc.  If you need more detailed examples, please read the Chef documentation.

[Chef Docs](http://docs.opscode.com)
[Recipe DSL Docs](http://docs.opscode.com/dsl_recipe.html)
[Recipe Resources](http://docs.opscode.com/resource.html)
[Chef Attributes](http://docs.opscode.com/essentials_cookbook_attribute_files.html)

## Testing your new recipe
### Testing in isolation
```
rake uw:test[recipe_name]
```

This will create a test suite for your recipe in .kitchen.yml, and run kitchen test for that suite.

### Testing with existing recipes
```
kitchen test default
```

This will converge all recipes and run all tests.  This is useful to find any conficts your new recipe may have introduces with existing recipes. 


## Finishing
When all tests are passing, push it back to github and issue a pull request

# Additional Reading
[Learn Chef](http://learnchef.opscode.com)
[Test Kitchen](http://test-kitchen.ci)
[Opscode Community Cookbooks](http://community.opscode.com)

# Author

Author:: UAFGINA (<scott@gina.alaska.edu>)
