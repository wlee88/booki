module SearchMixin
def self.included(base)
   base.extend ClassMethods
end

  module ClassMethods
    #Given a keyword to search, calls a like function on 
    def search(keyword)
      self.find(:all, :conditions => (create_queries(keyword)))
    end
    #create query, looping through columns of the model you have mixed in, with the given keyboard
    def create_queries(keyword)
    sql = ""
      self.column_names .each do |col|

          sql += col + " LIKE " + "\'" + keyword + "\'"
          sql += " OR "
      end
    sql[0..-5] #removes the last AND. A temporary dirty fix.
    end
  end
  
end