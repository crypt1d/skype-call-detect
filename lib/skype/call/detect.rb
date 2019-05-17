require "skype/call/detect/version"

module Skype
  module Call
    module Detect
      class PACTLError < StandardError; end

        def self.running?
          raise PACTLError, "pactl not found on this system" unless pactlExists?

          outputs = sourceOutputs
          result = false
 
          unless outputs.empty?
            outputs.each do |output|
              result = true if output[:application_name] == 'Skype' and output[:corked] == 'no'
            end
          end

          result
        end

        #Borrowed with some modifications from https://github.com/kaspernj/pulseaudio
        def self.sourceOutputs
          list = %x[pactl list source-outputs]
          outputs = []
    
          list.scan(/(\n|^)Source Output #(\d+)\s+([\s\S]+?)(\n\n|\Z)/) do |match|
            props = {}
            match[2].scan(/(\s+|^)([A-z]+?): (.+?)\n/) do |match_prop|
              props[match_prop[1].downcase.to_sym] = match_prop[2]
            end

            match[2].scan(/(\t\t|^)([A-z\.]+?) = (.+?)\n/) do |match_prop|
              props[match_prop[1].downcase.gsub(/\./, "_").to_sym] = match_prop[2].gsub(/\"/, "")
            end

            output_id = match[1].to_i
            props[:output_id] = output_id

            outputs << props
          end
    
        outputs
      end

      def self.pactlExists?
        system( "which pactl 1>/dev/null 2>&1" )
      end

    end
  end
end
