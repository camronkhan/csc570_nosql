#Excerpted from "Seven Databases in Seven Weeks",
# published by The Pragmatic Bookshelf.
# 
import 'org.apache.hadoop.hbase.client.HTable'
import 'org.apache.hadoop.hbase.client.Put'

def jbytes( *args )
  args.map { |arg| arg.to_s.to_java_bytes }
end

table = HTable.new( @hbase.configuration, "wiki" )

p = Put.new( *jbytes( "Home" ) )

p.add( *jbytes( "text", "", "Hello world" ) )
p.add( *jbytes( "revision", "author", "jimbo" ) )
p.add( *jbytes( "revision", "comment", "my first edit" ) )

table.put( p )

#What this code does
#
#The import lines bring references to useful HBase classes into the shell.
# 
#The jbytes()function takes any number of arguments and returns an array converted to
#Java byte arrays, as the HBase API methods demand.
#
#create a local variable (table) pointing to our wiki table, usingthe @hbase administration object #for configuration information.
#
#stage a commit operation by creating and preparing a new instance of Put, which takes the row to be #modified. In this instance, we will use the Home page we’ve been working with thus far. 
#
#p.add() properties to our Put instance and then call on the table object to execute the put #operation we’ve prepared. The add() method has several forms; in our case, we used the
#three-argument version: add(column_family, column_qualifier, value).