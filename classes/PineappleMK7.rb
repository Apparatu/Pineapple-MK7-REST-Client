require('json')
require('net/ssh')
require('fileutils')
require('rest-client')
include(RestClient)

# System modules
#
require_relative('../includes/System/Authentication.rb')
require_relative('../includes/System/LED.rb')

# Requester module
#
require_relative('../includes/Requester.rb')

# PineAP modules
#
require_relative('../includes/Modules/PineAP/Settings.rb')
require_relative('../includes/Modules/PineAP/Clients.rb')
require_relative('../includes/Modules/PineAP/Filtering.rb')

# Recon modules
#
require_relative('../includes/Modules/Recon/Scanning.rb')
require_relative('../includes/Modules/Recon/Handshakes.rb')

# Logging module
#
require_relative('../includes/Modules/Logging/Activity.rb')

module PineappleMK7

    class System

        class Authentication
            attr_accessor(:host, :port, :mac)
            attr_writer(:password)
            include(M_Authentication)
        end

        class LED
            include(M_LED)
        end

    end

    class Modules

        class PineAP

            class Settings
                attr_accessor(
                    :enablePineAP, 
                    :autostartPineAP, 
                    :armedPineAP, 
                    :ap_channel,
                    :karma,
                    :logging,
                    :connect_notifications,
                    :disconnect_notifications,
                    :capture_ssids,
                    :beacon_responses,
                    :broadcast_ssid_pool,
                    :pineap_mac,
                    :target_mac,
                    :beacon_response_interval,
                    :beacon_interval
                )
                include(Requester)
                include(M_Settings)
            end

            class Clients
                include(Requester)
                include(M_Clients)
            end

            class Filtering
                include(Requester)
                include(M_Filtering)
            end

        end

        class Recon

            class Scanning
                include(Requester)
                include(M_Scanning)
            end

            class Handshakes
                include(Requester)
                include(M_Handshakes)
            end

        end

        class Logging

            class Activity
                include(Requester)
                include(M_Activity)
            end

        end

    end

end