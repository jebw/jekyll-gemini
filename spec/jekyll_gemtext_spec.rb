# frozen_string_literal: true

require 'spec_helper'

RSpec.describe JekyllGemtext do
  describe '#convert' do
    subject { described_class.new.convert gemtext }

    let(:gemtext) { "# Title\nParagraph content" }
    let(:html) { "<h1>Title</h1>\n<p>Paragraph content</p>\n" }

    it { is_expected.to eq html }
  end
end
