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

end