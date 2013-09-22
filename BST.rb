#!/usr/bin/env ruby

class BST
    class BSTNode
        def initialize(num)
            @data=num
            @parent=nil
            @left=nil
            @right=nil
        end

        def data
            return @data
        end

        def right
            return @right
        end

        def left
            return @left
        end

        def parent
            return @parent
        end

        def right=(x)
            @right=x
        end

        def left=(x)
            @left=x
        end

        def parent=(x)
            @parent=x
        end

        def data=(x)
            @data=x
        end
    end

    def initialize(*list)
        @size=0
        @root=nil
        return if list.empty?

        if list.first.is_a?(Array)
            arr_initialize(list.first) 
        else
            raise "Unrecognized data type"
        end
    end

    def arr_initialize(list)
        list.each { |num|
            insert(num)
        }
    end

    def size
        return @size
    end

    def insert(num)
        raise "Parameter is not integer!" if !num.is_a?(Integer)
        curr=BSTNode.new(num)

        if @size==0
            @root=curr
        else
            insertRecur(@root, curr)
        end

        @size+=1
        return num
    end

    def insertRecur(curr, node)
        return node if curr==nil

        if node.data>curr.data
            curr.right=insertRecur(curr.right, node)
            curr.right.parent=curr
        else
            curr.left=insertRecur(curr.left, node)
            curr.left.parent=curr
        end

        return curr
    end

    def has?(num)
        raise "Parameter is not integer!" if !num.is_a?(Integer)
        return find(@root, num)!=nil
    end

    def find(curr, num)
        return nil if curr==nil
        return curr if curr.data==num
        return find(curr.right, num) if num>curr.data
        return find(curr.left, num)
    end

    def predecessor_node(node)
        return findMaxRecur(node.left) if node.left!=nil

        while node.parent!=nil && node.parent.data>=node.data
            node=node.parent
        end

        return node.parent
    end

    def successor_node(node)
        return findMinRecur(node.right) if node.right!=nil

        while node.parent!=nil && node.parent.data<=node.data
            node=node.parent
        end

        return node.parent
    end

    def delete(num)
        raise "Parameter is not integer!" if !num.is_a?(Integer)
        u=find(@root, num)
        return nil if u==nil

        if u.left!=nil && u.right!=nil
           s=predecessor_node(u)
           s.data, u.data=u.data, s.data
           u=s
        end

        p=u.parent

        if u.left==nil && u.right!=nil
            c=u.right
        elsif u.left!=nil && u.right==nil
            c=u.left
        else
            c=nil
        end

        if u.data>p.data
            p.right=c
        else
            p.left=c
        end

        @size-=1
        return num
    end

    def findMin
        return nil if @size==0
        return findMinRecur(@root).data
    end

    def findMinRecur(curr)
        return curr if curr.left==nil
        return findMinRecur(curr.left)
    end

    def findMax
        return nil if @size==0
        return findMaxRecur(@root).data
    end

    def findMaxRecur(curr)
        return curr if curr.right==nil
        return findMaxRecur(curr.right)
    end

    def successor(num)
        raise "Parameter is not integer!" if !num.is_a?(Integer)
        curr=find(@root, num)
        return nil if curr==nil
        succ=successor_node(curr)
        return nil if succ==nil
        return succ.data
    end

    def predecessor(num)
        raise "Parameter is not integer!" if !num.is_a?(Integer)
        curr=find(@root, num)
        return nil if curr==nil
        pred=predecessor_node(curr)
        return nil if pred==nil
        return pred.data
    end

    private :findMaxRecur, :findMinRecur, :find, :predecessor_node, :successor_node, :insertRecur, :arr_initialize
end
