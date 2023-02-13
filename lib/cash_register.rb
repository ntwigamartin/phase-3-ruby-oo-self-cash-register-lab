require 'pry'

class CashRegister
    
    attr_accessor :discount, :total

    def initialize(discount = 0)
        @discount = discount
        self.total = 0
        @items_list = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 0)
        if quantity > 0
            self.total += price * quantity
            @last_transaction = price * quantity
            
            quantity.times do 
                @items_list << title

            end

        else
            self.total += price
            @items_list << title
            @last_transaction = price
        end
        
    end

    def apply_discount
        if self.discount > 0
            self.total = (self.total * (100 - self.discount)/100.to_f).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items_list
    end

    def void_last_transaction
        self.total -= @last_transaction
        @items_list.pop
    end
end

# binding.pry