require_relative 'config.rb'
include Libraries

module Libraries
    module Wait

        # avoid defining self in def self.some_method -> def some_method
        class << self

            # To wait for the element until its dispalyed
            def wait_for_element(locator, timeout=Config.implicit_wait, focus_driver = $focus_driver)
                index=0
                while locator.is_present?(focus_driver) == false
                    sleep 1
                    if index == timeout
                        break
                    end
                    index+=1
                end
            end

            # To wait for the element until its hidden
            def wait_for_element_hide(locator, timeout=Config.implicit_wait, focus_driver = $focus_driver)
                index=0
                while locator.is_present?(focus_driver) == true
                    sleep 1
                    if index == timeout
                        break
                    end
                    index+=1
                end
            end
        end
    end
end
  