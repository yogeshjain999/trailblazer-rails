module Trailblazer::Rails::Controller::Cell
  private # rubocop:disable Lint/UselessAccessModifier

  module Render
    def render(cell = nil, options = {}, *, &block)
      return super unless cell.kind_of?(::Cell::ViewModel)
      render_cell(cell, options)
    end

    def render_cell(cell, options)
      options = options.reverse_merge(layout: true)

      # render the cell.
      content = cell.()

      render({html: content}.merge(options))
    end
  end

  include Render
end
