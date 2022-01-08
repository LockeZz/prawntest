class OrderPdf < Prawn::Document 

    def initialize(order)
        super(top_margin: 70)
        @order = order
        order_number
        line_items
        border_test
    end

    def order_number 
        text "Order \##{@order.index}", size: 30, style: :bold
    end

    def line_items 
        move_down 20
        table(table_show) do 
            row(0).style :align => :center
            columns(1..3).style :align => :right
        end
    end

    def table_show
        [table_header, table_body]
    end

    def table_header 
        ["Product", "QTY", "Unit Price", "Full Price"]  
    end

    def table_body 
        # @order.tap { |item| [item.index, item.show, item.created_at, item.updated_at]}
        # [@order.index, @order.show, @order.created_at, @order.updated_at]
        [@order.index, @order.show, @order.created_at.to_s, "$"]
    end

    def border_test 
        font_size 10
        move_down 10 
        data = [["Name: TEST!<br>IC: 1234565<br> UID: 123dsakdhk13"]]
        table(data) do 
            columns(1..3).width = 100
            self.cell_style = { :inline_format => true}
        end
    end
end