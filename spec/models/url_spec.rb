require 'rails_helper'

RSpec.describe Url, type: :model do
  describe '.save' do
    subject { ->(url) { url.save } }

    context 'success' do
      context 'if url is not presented in db' do
        let(:url) { build :url }

        it { expect(subject.call(url)).to eq(true) }
      end

      context 'if url is differ' do
        let!(:url) { create :url }
        let(:diff_url) do
          build :url,
            long_url: 'https://www.rust-lang.org/ru-RU/install.html'
        end

        it { expect(subject.call(diff_url)).to eq(true) }
      end
    end

    context 'failure' do
      context 'if url is presented in db' do
        let!(:url) { create :url }

        it { expect(subject.call(url)).to eq(false) }
      end

      context 'if url is in another case' do
        let!(:url) { create :url, long_url: 'https://www.rust-lang.org/ru-RU/install.html' }
        let(:present_url) { build :url, long_url: 'https://www.RUST-LANG.org/ru-RU/install.html' }

        it { expect(subject.call(present_url)).to eq(false) }
      end

      context 'if url protocol differs but urls equals' do
        let!(:url) { create :url, long_url: 'https://www.rust-lang.org/ru-RU/install.html' }
        let(:present_url) { build :url, long_url: 'http://www.RUST-LANG.org/ru-RU/install.html' }

        it { expect(subject.call(present_url)).to eq(false) }
      end
    end
  end
end
