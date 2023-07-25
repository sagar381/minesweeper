class BoardCreator

    def self.grid(mines , rows, cols)

        dimension = rows * cols
        mines_locations = placements(rows, cols, mines)
        
        fill_board(mines_location, rows, cols)
    end
    
    def self.fill_board(mines_locations , rows, cols)
        grid = Array.new(rows) { Array.new(cols) }
        rows.times do |r|
            cols.times do |c|
                index = r * cols + c
                grid[r][c] = mines_locations.include?(index) ? -1 : count_neighbour_mines(index, rows, cols, mines_locations)
            end
        end
        grid
    end
    
    def self.placements(rows = 0, cols = 0, mines = 0)

        dimension = rows * cols

        (0..dimension - 1).to_a.sample(mines)
    end

    private


    def self.neighbours(index, rows, cols)
        directions = [-cols - 1, -cols, -cols + 1, -1, 1, cols - 1, cols, cols + 1]
        directions.map{|direction| [index + direction, direction]}
            .select { |(neighbour_index, direction)|  valid_neighbour?(index, neighbour_index, rows, cols, direction) }.map(&:first).uniq
    end

    def self.valid_neighbour?(index, neighbour_index, rows, cols, direction)
        neighbour_index >= 0 && neighbour_index < rows * cols &&
        !((index % cols) == 0 && (direction == -1 || direction == (cols - 1) || direction == (-cols - 1))) && 
        !((index % cols) == (cols - 1) && (direction == 1 || direction == (-cols + 1) || direction == (cols + 1)))
    end

    def self.count_neighbour_mines(index, rows, cols, mines_locations)
        neighbours(index, rows, cols).count { |neighbour_index| mines_locations.include?(neighbour_index) }
    end
end