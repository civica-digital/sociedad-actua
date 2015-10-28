module Creds
  module Helper

    def creds_h
      if node["key_file"]
        secret = Chef::EncryptedDataBagItem.load_secrets("#{node['key_file']['path']}")
        creds = Chef::EncryptedDataBagItem.load("urbem", "keys", secret)
      else
        creds = data_bag_item('keys', 'secret')
      end

      creds
    end

    def list_creds
        creds = creds_h

        creds.each do |k, v|
          if v.class == Hash
            v.each do |sk, sv|
              list_creds << "#{k.upcase}_#{sk.upcase}=#{sv}"
            end
          else
            list_creds << "#{k.upcase}=#{v}"
          end
        end

        list_creds
    end

    def postgres_pwd
      creds = creds_h
      creds['postgres']['password']
    end

  end
end
