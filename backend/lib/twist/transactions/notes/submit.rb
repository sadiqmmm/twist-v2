module Twist
  module Transactions
    module Notes
      class Submit
        include Dry::Transaction
        include Twist::Import["repositories.book_note_repo"]
        include Twist::Import["repositories.note_repo"]

        step :submit

        def submit(book_id:, user_id:, element_id:, text:)
          note_count = book_note_repo.count_for_book(book_id)
          note = note_repo.create(
            number: note_count + 1,
            state: "open",
            user_id: user_id,
            element_id: element_id,
            text: text,
          )
          Success(note)
        end
      end
    end
  end
end
