module Twist
  module Repositories
    class NoteRepo < Twist::Repository[:notes]
      commands :create, use: :timestamps, plugins_options: { timestamps: { timestamps: %i(created_at updated_at) } }
      commands update: :by_pk

      # rubocop:disable Metrics/AbcSize
      def count(element_ids)
        counts = notes.counts_for_elements(element_ids)

        missing = element_ids.select { |id| counts.none? { |c| c.element_id == id } }
        counts += missing.map { |m| NoteCount.new(element_id: m, count: 0) }
        counts.map { |element_id:, count:| [element_id, count] }.to_h
      end
      # rubocop:enable Metrics/AbcSize

      def close(id)
        update(id, state: "closed")
      end

      def open(id)
        update(id, state: "open")
      end
    end
  end
end
