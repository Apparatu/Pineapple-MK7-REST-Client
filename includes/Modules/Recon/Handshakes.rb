module M_Handshakes

    public def start(ap)
        self.call(
            'POST',
            'pineap/handshakes/start',
            ap,
            '{"success":true}'
        )
    end

    public def stop()
        self.call(
            'POST',
            'pineap/handshakes/stop',
            '',
            '{"success":true}'
        )
    end

    public def output()
        self.call(
            'GET',
            'pineap/handshakes',
            '',
            '{"handshakes":'
        )
    end

end