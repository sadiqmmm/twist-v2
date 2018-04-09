module Books
  module GraphQL
    module Resolvers
      module Note
        class ByBook
          def call(book, _args, _ctx)
            book_note_repo = BookNoteRepository.new
            book_note_repo.by_book(book.id)
          end
        end

        class ByElement
          def call(element, _args, _ctx)
            book_note_repo = BookNoteRepository.new
            book_note_repo.by_element(element.id)
          end
        end

        class Count
          def call(element, _args, ctx)
            ctx[:note_count_loader].load(element.id)
          end
        end

        class Submit
          def call(_obj, args, ctx)
            note_repo = NoteRepository.new
            note_repo.create(
              user_id: ctx[:current_user].id,
              element_id: args["elementID"],
              text: args["text"]
            )
          end
        end
      end
    end
  end
end
