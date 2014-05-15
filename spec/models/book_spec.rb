require 'spec_helper'

describe Book do
  context "with PDFs" do
    describe '#pdf_url' do
      it 'returns a url to the PDF type of the book' do
        book = Book.create(:title => "Test Book")
        book.types.create(:format => "PDF", "file" => "book.pdf")

        expect(book.pdf_url).to eq("")
      end
    end
    describe '#pdf_url' do
      it 'returns a url to the PDF type of the book' do
        book = Book.create(:title => "Test Book")
        book.types.create(:format => "PDF", "file" => "book.pdf")
        expect(book.pdf_url).to eq(
          "https://" + 
          ENV['AMAZON_BUCKET'] + 
          ".s3.amazonaws.com/uploads/" +
          book.types.first.class.name.underscore +
          "/file/" +
          "#{book.id}/" +
          book.types.first.filename.to_s
        )
      end
    end
  end
end
