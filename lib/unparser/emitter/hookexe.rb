module Unparser
  class Emitter
    # Base class for pre and postexe emitters
    class Hookexe < self

    private

      # Perfrom dispatch
      #
      # @return [undefined]
      #
      # @api private
      #
      def dispatch
        write(self.class::KEYWORD, WS)
        parentheses(*CURLY_BRACKETS) do
          emit_body
        end
      end

      # Emit body
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_body
        indented { visit(first_child) }
      end

      # Emitter for postexe nodes
      class Preexe < self

        KEYWORD = K_PREEXE

        handle :preexe

      end # Postexe

      # Emitter for postexe nodes
      class Postexe < self

        KEYWORD = K_POSTEXE

        handle :postexe

      end # Postexe
    end # Hookexe
  end # Emitter
end # Unparser