# PINEAPPLE MARK VII REST CLIENT

- The leading rogue access point and WiFi pentest toolkit for close access operations.
- Passive and active attacks analyze vulnerable and misconfigured devices. 
- __@*HAK5*__

> __Author__::      TW-D
>
> __Version__::     1.2.0
>
> __Copyright__::   Copyright (c) 2021 TW-D
>
> __License__::     Distributes under the same terms as Ruby
>
> __Doc__::         https://hak5.github.io/mk7-docs/docs/rest/rest/
>
> __Requires__::    ruby >= 2.7.0, rest-client 2.1.0 gem, net-ssh 6.1.0 gem and Pineapple Mark VII Firmware v1.1.0-stable
>  
>
> __Installation__::
>
> * sudo apt-get install ruby ruby-dev
>
> * sudo gem install rest-client net-ssh

## Payloads

In "./payloads/" you will find :

__RECON__

- access-points_clients.rb
> Retrieves the list of access points and clients, associated or not.

- clients-probes.rb
> Retrieves lists of probe requests issued by clients.

__EXPLOITATION__

- rogue-access-points.rb
> From a list, broadcast SSIDs and retrieve the list of clients associated with one of them.

- twin-access-points.rb
> Observe access points and associated clients, broadcast SSIDs with a similar name and then disconnect the clients.

## Payload skeleton for development

```ruby
require_relative('<PATH-TO>/classes/PineappleMK7.rb')

system_authentication = PineappleMK7::System::Authentication.new
system_authentication.host = "<PINEAPPLE-IP-ADDRESS>"
system_authentication.port = 1471
system_authentication.mac = "<PINEAPPLE-MAC-ADDRESS>"
system_authentication.password = "<ROOT-ACCOUNT-PASSWORD>"

if (system_authentication.login)

    led = PineappleMK7::System::LED.new

    # SETUP
    #
    led.setup

    # ATTACK
    #
    led.attack

    # SPECIAL
    #
    led.special

    # FINISH
    #
    led.finish

    # CLEANUP
    #
    led.cleanup

    # OFF
    #
    led.off

else

    # FAILED
    #
    led.failed
    
end
```

__Note :__ Don't hesitate to take inspiration from the payloads.

## System modules

### Authentication accessors/method

```ruby
system_authentication = PineappleMK7::System::Authentication.new

system_authentication.host = (string) "<PINEAPPLE-IP-ADDRESS>"
system_authentication.port = (integer) 1471
system_authentication.mac = (string) "<PINEAPPLE-MAC-ADDRESS>"
system_authentication.password = (string) "<ROOT-ACCOUNT-PASSWORD>"

system_authentication.login()
```

### LED methods

```ruby
led = PineappleMK7::System::LED.new

led.setup()
led.failed()
led.attack()
led.special()
led.cleanup()
led.finish()
led.off()
```

## Pineapple Modules

### Logging

#### Activity methods

```ruby
logging_activity = PineappleMK7::Modules::Logging::Activity.new

logging_activity.output()
logging_activity.clear()
```

### PineAP

#### Clients methods

```ruby
pineap_clients = PineappleMK7::Modules::PineAP::Clients.new

pineap_clients.connected_clients()
pineap_clients.kick( (string) mac )
pineap_clients.clear_previous()
```

#### Filtering methods

```ruby
pineap_filtering = PineappleMK7::Modules::PineAP::Filtering.new

pineap_filtering.client_filter( (string) "allow" | "deny" )
pineap_filtering.add_client( (string) mac )
pineap_filtering.clear_clients()
pineap_filtering.ssid_filter( (string) "allow" | "deny" )
```

#### Settings accessors/methods

```ruby
pineap_settings = PineappleMK7::Modules::PineAP::Settings.new

pineap_settings.enablePineAP = (boolean default:false)
pineap_settings.autostartPineAP = (boolean default:false)
pineap_settings.armedPineAP = (boolean default:false)
pineap_settings.ap_channel = (string default:'11')
pineap_settings.karma = (boolean default:false)
pineap_settings.logging = (boolean default:false)
pineap_settings.connect_notifications = (boolean default:false)
pineap_settings.disconnect_notifications = (boolean default:false)
pineap_settings.capture_ssids = (boolean default:false)
pineap_settings.beacon_responses = (boolean default:false)
pineap_settings.broadcast_ssid_pool = (boolean default:false)
pineap_settings.pineap_mac = (string default:system_authentication.mac)
pineap_settings.target_mac = (string default:'FF:FF:FF:FF:FF:FF')
pineap_settings.beacon_response_interval = (string default:'NORMAL')
pineap_settings.beacon_interval = (string default:'NORMAL')

pineap_settings.save()
pineap_settings.add_ssid( (string) ssid )
pineap_settings.clear_pool()
```

### Recon

#### Handshakes methods

```ruby

```

#### Scanning methods

```ruby
recon_scanning = PineappleMK7::Modules::Recon::Scanning.new

recon_scan = recon_scanning.start( (integer) scan_time )
recon_output = recon_scanning.output( (integer) recon_scan.scanID )

ap = recon_output[0]
recon_scanning.deauth_ap( (object) ap )

recon_scanning.delete( (integer) recon_scan.scanID )
```