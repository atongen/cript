module Cript
  class KeyInfo
    def ssh_key_to_pem(path)
      ssh_keygen("-f \"#{path}\" -e -m pem")
    end

    def ssh_keygen(cmd)
      ssh_keygen = %x{ which ssh-keygen }.to_s.strip
      if ssh_keygen != ""
        %x{ #{ssh_keygen} #{cmd} }.to_s.strip
      else
        raise "ssh-keygen not available"
      end
    end

    def type
      @opt[:type] || key_info[:type]
    end

    def size
      @opt[:size] || key_info[:size]
    end

    def fingerprint
      @opt[:fingerprint] || key_info[:fingerprint]
    end

    def comment
      @opt[:comment] || key_info[:comment]
    end

    def key_content(type = :public)
      type = :private unless type == :public
      if @opt[:"#{type}_key_content"]
        @opt[:"#{type}_key_content"]
      elsif @opt[:"#{type}_key_path"]
        content = File.read(@opt[:"#{type}_key_path"])
        if content.include?("#{type.to_s.upcase} KEY")
          content
        else
          ssh_key_to_pem(@opt[:"#{type}_key_path"])
        end
      else
        raise Cript::Cripter::Error, "No #{type} key content"
      end
    end

    def key_info
      @key_info ||= begin
        if @opt[:public_key_path]
          info = ssh_keygen("-l -f \"#{@opt[:public_key_path]}\"").split(/[\s]+/)
          if info.length == 4
            { size: info[0].to_i, fingerprint: info[1], comment: info[2], type: info[3].match(/([\w]+)/)[1].downcase }
          end
        end
      end
    end
  end
end
