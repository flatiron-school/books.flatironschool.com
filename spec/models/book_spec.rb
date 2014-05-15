require 'spec_helper'

describe Book do
  context "with PDFs" do
    describe '#pdf_url' do
      it 'returns a url to the PDF type of the book' do
        book = Book.create(:name => "Test Book")
        books.types.create(:format => "PDF", "file" => "book.pdf")

        expect(book.pdf_url).to eq("")
      end
    end
  end
end
