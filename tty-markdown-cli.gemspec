# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "tty-markdown-cli"
  spec.version       = "0.1.0"
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.summary       = %q{A command-line tool for displaying Markdown documents in a nicely formatted terminal output.}
  spec.description   = %q{A command-line tool for displaying Markdown documents in a nicely fromatted terminal output.}
  spec.homepage      = "https://ttytoolkit.org"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["bug_tracker_uri"] = "https://github.com/piotrmurach/tty-markdown-cli/issues"
  spec.metadata["changelog_uri"] = "https://github.com/piotrmurach/tty-markdown-cli/blob/master/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/tty-markdown-cli"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/piotrmurach/tty-markdown-cli"

  spec.files         = ["man/tty-markdown.1"]
  spec.extra_rdoc_files = Dir["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.bindir        = "exe"
  spec.executables   = ["tty-markdown"]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.add_dependency "tty-markdown", "~> 0.7"

  spec.add_development_dependency "kramdown", ">= 1.16.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0"
end
