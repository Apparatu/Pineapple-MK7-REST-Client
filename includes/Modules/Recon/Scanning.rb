module M_Scanning

    private def convert_encryption(encryption)
        #
    end

    public def start(scan_time)
        response = self.call(
            'POST',
            'recon/start',
            {
                "live" => false,
                "scan_time" => (scan_time === 0) ? 30 : scan_time,
                "band" => "0"
            },
            '{"scanRunning":true,"scanID":'   
        )
        sleep(scan_time + 10)
        return(response)
    end

    public def output(scanID)
        response = self.call(
            'GET',
            ('recon/scans/' + scanID.to_s()),
            '',
            '{"APResults":['
        )
        response.APResults = (response.APResults.nil? ? [] : response.APResults)
        response.UnassociatedClientResults = (response.UnassociatedClientResults.nil? ? [] : response.UnassociatedClientResults)
        response.OutOfRangeClientResults = (response.OutOfRangeClientResults.nil? ? [] : response.OutOfRangeClientResults)
        return(response)
    end

    public def deauth_ap(ap)

        clients_mac = []
        ap.clients.each do |client|
            clients_mac << client.client_mac
        end

        self.call(
            'POST',
            'pineap/deauth/ap',
            {
                "bssid" => ap.bssid,
                "multiplier" => 7,
                "channel" => ap.channel,
                "clients" => clients_mac
            },
            '{"success":true}'
        )

    end

    public def delete(scanID)
        self.call(
            'DELETE',
            ('recon/scans/' + scanID.to_s()),
            '',
            '{"success":true}'
        )
    end

end