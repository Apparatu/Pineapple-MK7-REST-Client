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

## Usage

```ruby
require_relative('<PATH-TO>/classes/PineappleMK7.rb')

SCAN_TIME = 60

system_authentication = PineappleMK7::System::Authentication.new
system_authentication.host = "172.16.42.1"
system_authentication.port = 1471
system_authentication.mac = "00:13:37:DD:EE:FF"
system_authentication.password = "<ROOT-ACCOUNT-PASSWORD>"

if (system_authentication.login)

    led = PineappleMK7::System::LED.new

    # SETUP
    #
    led.setup

    pineap_settings = PineappleMK7::Modules::PineAP::Settings.new
    pineap_settings.enablePineAP = true
    pineap_settings.save

    # ATTACK
    #
    led.attack

    recon_scanning = PineappleMK7::Modules::Recon::Scanning.new
    scanID = (recon_scanning.start(SCAN_TIME)).scanID
    output = recon_scanning.output(scanID)
    
    puts('[+] APResults')
    apResults = (output.APResults.nil? ? [] : output.APResults)
    apResults.each do |ap|
        pp(ap)
    end

    puts('[+] OutOfRangeClientResults')
    outOfRangeClientResults = (output.OutOfRangeClientResults.nil? ? [] : output.OutOfRangeClientResults)
    outOfRangeClientResults.each do |client|
        pp(client)
    end

    puts('[+] UnassociatedClientResults')
    unassociatedClientResults = (output.UnassociatedClientResults.nil? ? [] : output.UnassociatedClientResults)
    unassociatedClientResults.each do |client|
        pp(client)
    end

    # FINISH
    #
    led.finish

    pineap_settings.enablePineAP = false
    pineap_settings.save

    # CLEANUP
    #
    led.cleanup

    recon_scanning.delete(scanID)
    logging_activity = PineappleMK7::Modules::Logging::Activity.new
    logging_activity.clear

    # OFF
    #
    led.off

end
```

## System modules

### Authentication accessors/method

```ruby

```

### LED methods

```ruby

```

## Pineapple Modules

### Logging

#### Activity methods

```ruby

```

### PineAP

#### Clients methods

```ruby

```

#### Filtering methods

```ruby

```

#### Settings methods

```ruby

```

### Recon

#### Handshakes methods

```ruby

```

#### Scanning methods

```ruby

```