require 'helper'
require "test/unit"
require "pp"

class TestSugarcrm < Test::Unit::TestCase
  context "A SugarCRM::Response instance" do
    setup do
      @json =  {"entry_list"=> [{
                "name_value_list"=> {
                  "address_city" => {"name"=>"address_city", "value"=>""},
                  "receive_notifications" => {"name"=>"receive_notifications", "value"=>"1"},
                  "is_group" => {"name"=>"is_group", "value"=>"0"},
                  "pwd_last_changed" => {"name"=>"pwd_last_changed", "value"=>"never"}
                },
                "id"=>"1",
                "module_name"=>"Users"
              }],
             "relationship_list"=>[]}
  
      @response = SugarCRM::Response.new(@json)
    end
    
    should "set the module name" do
      assert_equal "User", @response.module
    end
    
    should "flatten the name_value_list into an attributes hash" do
      assert_equal "never", @response.attributes[:pwd_last_changed]
    end
      
    should "return an instance of a SugarCRM Module when #object" do
      assert_instance_of SugarCRM::User, @response.object
    end
      
  end
end