# frozen_string_literal: true

require "open3"
require "tempfile"

RSpec.describe "tty-markdown command" do
  let(:cmd) { RSpec::Support::OS.windows? ? "tty-markdown" : "exe/tty-markdown" }

  it "runs with piped input" do
    out, err, status = Open3.capture3("echo \"#Header\" | #{cmd}")

    expect(out).to match(/\e\[36;1;4mHeader\e\[0m/)
    expect(err).to eq("")
    expect(status.exitstatus).to eq(0)
  end

  it "runs with text input" do
    out, err, status = Open3.capture3("#{cmd} \"#Header\"")

    expect(out).to match(/\e\[36;1;4mHeader\e\[0m/)
    expect(err).to eq("")
    expect(status.exitstatus).to eq(0)
  end

  it "runs with file path" do
    tempfile = Tempfile.new("markdown")
    begin
      tempfile.write("#Header")
      tempfile.rewind

      out, err, status = Open3.capture3("#{cmd} #{tempfile.path}")

      expect(out).to match(/\e\[36;1;4mHeader\e\[0m/)
      expect(err).to eq("")
      expect(status.exitstatus).to eq(0)
    ensure
      tempfile.close
      tempfile.unlink
    end
  end

  it "prints help" do
    out, err, status = Open3.capture3("#{cmd} --help")

    expect(out).to eq([
      "Usage: tty-markdown [options] [file]\n",
      "    -h, --help                       Display help\n",
      "    -v, --version                    Display the version\n"
    ].join)
    expect(err).to eq("")
    expect(status.exitstatus).to eq(0)
  end

  it "prints error messsage and exits with 1" do
    out, err, status = Open3.capture3("#{cmd} --unknown")

    expect(out).to eq("")
    expect(err).to eq("invalid option: --unknown\n")
    expect(status.exitstatus).to eq(1)
  end
end
