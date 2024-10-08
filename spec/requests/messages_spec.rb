require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /" do
    it "sets a UUID in the session if it doesn't exist" do
      allow(SecureRandom).to receive(:uuid).and_return("1234")

      get root_path
      expect(session[:uuid]).to eq("1234")
    end

    it "does not modify the session UUID if it already exists" do
      allow(SecureRandom).to receive(:uuid).and_return("1234")
      get root_path
      expect(session[:uuid]).to eq("1234")

      allow(SecureRandom).to receive(:uuid).and_return("5678")
      get root_path
      expect(session[:uuid]).to eq("1234")
    end

    it "fetches the last 10 messages in descending order of created_at" do
      # TODO: Write a better spec for this.
      messages_double = double("ActiveRecord::Relation")
      message = Message.create!(uuid: SecureRandom.uuid, content: "Hello, World!")

      expect(Message).to receive(:order).with(created_at: :desc).and_return(messages_double)
      expect(messages_double).to receive(:limit).with(10).and_return(message)
      get messages_path
    end

    it "returns a successful response" do
      get messages_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /messages" do
    let(:uuid) { SecureRandom.uuid }

    context "unsuccessful creation" do
      it "does not create a new Message" do
        expect {
          post messages_path, params: { message: { uuid: uuid, content: "" } }
        }.not_to change(Message, :count)
      end

      it "returns a 400 Bad Request response" do
        post messages_path, params: { message: { uuid: uuid, content: "" } }
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "successful creation" do
      it "creates a new Message" do
        expect {
          post messages_path, params: { message: { uuid: uuid, content: "Hello, World!" } }
        }.to change(Message, :count).by(1)

        message = Message.last
        expect(message.uuid).to eq(uuid)
        expect(message.content).to eq("Hello, World!")
      end

      it "sends a broadcast to messages with Turbo Stream" do
        expect {
          post messages_path, params: { message: { uuid: uuid, content: "Hello, World!" } }, as: :turbo_stream
        }.to have_broadcasted_to("messages")
      end

      it "redirects to the root path when not Turbo Stream" do
        post messages_path, params: { message: { uuid: uuid, content: "Hello, World!" } }
        expect(response).to be_redirect
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET /all" do
    # TODO: Write a better specs for this.
    it "returns a successful response" do
      get all_messages_path
      expect(response).to have_http_status(:success)
    end
  end
end
