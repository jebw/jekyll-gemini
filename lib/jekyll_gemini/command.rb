# frozen_string_literal: true

class JekyllGemini::Command < Jekyll::Command
  class << self
    def init_with_program(prog)
      prog.command(:gemini) do |c|
        c.syntax "gemini [options]"
        c.description 'Build the Gemini capsule'

        add_build_options(c)

        c.action do |_, options|
          options["serving"] = false
          process_with_graceful_fail(c, options, self)
        end
      end

      def process(options)
        # Adjust verbosity quickly
        Jekyll.logger.adjust_verbosity(options)

        options = configuration_from_options(options)
        capsule = JekyllGemini::Capsule.new(options)

        if options.fetch("skip_initial_build", false)
          Jekyll.logger.warn "Build Warning:", "Skipping the initial build." \
                             " This may result in an out-of-date site."
        else
          build(capsule, options)
        end
      end

      def build(site, options)
        t = Time.now
        source      = File.expand_path(options["source"])
        destination = File.expand_path(options["destination"])
        incremental = options["incremental"]
        Jekyll.logger.info "Source:", source
        Jekyll.logger.info "Destination:", destination
        Jekyll.logger.info "Incremental build:",
                           (incremental ? "enabled" : "disabled. Enable with --incremental")
        Jekyll.logger.info "Generating..."
        process_site(site)
        Jekyll.logger.info "", "done in #{(Time.now - t).round(3)} seconds."
      end

      def configuration_from_options(options)
        return options if options.is_a?(::Jekyll::Configuration)

        ::JekyllGemini::Configuration.build(options)
      end
    end
  end
end
