# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class is the abstract base class for IRC events.
      class Base < Twitch::Bot::Event
        def initialize(_message)
          @type = :unknown
        end
      end

      # This class represents an event that is not supported.
      class NotSupported < Base
        attr_reader :message

        def initialize(message)
          @message = message
          @type = :not_supported
        end
      end

      # This class stores the details of a Ping event.
      class Ping < Base
        attr_reader :hostname

        def initialize(hostname:)
          @hostname = hostname
          @type = :ping
        end
      end

      # This class stores the details of a Mode event.
      class Mode < Base
        attr_reader :user, :mode

        def initialize(user:, mode:)
          @user = user
          @mode = mode
          @type = :mode
        end
      end

      # This class stores the details of an Authenticated event.
      class Authenticated < Base
        def initialize
          @type = :authenticated
        end
      end

      # This class stores the details of a Join event.
      class Join < Base
        def initialize
          @type = :join
        end
      end

      # This class stores the details of a Subscription event.
      class Subscription < Base
        attr_reader :user

        def initialize(user:)
          @user = user
          @type = :subscription
        end
      end

      # This class stores the details of a LoginFailed event.
      class LoginFailed < Base
        attr_reader :user

        def initialize(user:)
          @user = user
          @type = :login_failed
        end
      end

      # This class stores the details of a SlowMode event.
      class SlowMode < Base
        attr_reader :status, :channel

        def initialize(status:, channel:)
          @status = status
          @channel = channel
          @type = :slow_mode
        end

        def enabled?
          status.to_i.positive?
        end
      end

      # This class stores the details of a FollowersOnlyMode event.
      class FollowersOnlyMode < Base
        attr_reader :status

        def initialize(status:)
          @status = status
          @type = :followers_only_mode
        end
      end

      # This class stores the details of a SubsOnlyMode event.
      class SubsOnlyMode < Base
        attr_reader :status, :channel

        def initialize(status:, channel:)
          @status = status
          @channel = channel
          @type = :subs_only_mode
        end
      end

      # This class stores the details of a R9kMode event.
      class R9kMode < Base
        attr_reader :status, :channel

        def initialize(status:, channel:)
          @status = status
          @channel = channel
          @type = :r9k_mode
        end
      end
    end
  end
end

require_relative "message/user_message"
