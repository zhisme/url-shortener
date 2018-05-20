require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe 'POST #create' do
    subject { post :create, params: params }

    describe 'success' do
      let(:params) { {long_url: 'https://www.rust-lang.org/ru-RU/install.html'} }

      it { expect(subject).to be_created }
    end

    describe 'failure' do
      context 'invalid url' do
        let(:params) { {long_url: 'invalid'} }

        it { expect(json_body['errors']).to_not be_empty }
        it { expect(json_body['errors']['long_url']).to_not be_empty }
      end

      context 'already present' do
        let!(:url) { create :url }
        let(:params) { {long_url: url.long_url} }

        it { expect(json_body['errors']).to_not be_empty }
        it { expect(json_body['errors']['long_url']).to_not be_empty }
      end
    end
  end
end
