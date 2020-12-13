classdef tree
    properties (SetAccess = private)
        Node = { [] };
        Parent = [ 0 ]; 
    end
    methods
        function [obj, root_ID] = tree(content, val)
            if nargin < 1
                root_ID = 1;
                return
            end
            if isa(content, 'tree')
                obj.Parent = content.Parent;
                if nargin > 1 
                    if strcmpi(val, 'clear')
                        obj.Node = cell(numel(obj.Parent), 1);
                    else
                        cellval = cell(numel(obj.Parent), 1);
                        for i = 1 : numel(obj.Parent)
                            cellval{i} = val;
                        end
                        obj.Node = cellval;
                    end
                else
                    obj.Node = content.Node;
                end
            else
                obj.Node = { content };
                root_ID = 1;
            end
        end
        function [obj, ID] = addnode(obj, parent, data)
            if parent < 0 || parent > numel(obj.Parent)
                error('MATLAB:tree:addnode', ...
                    'Cannot add to unknown parent with index %d.\n', parent)
            end
            if parent == 0
                obj.Node = { data };
                obj.Parent = 0;
                ID = 1;
                return
            end
            obj.Node{ end + 1, 1 } = data;
            
            obj.Parent = [
                obj.Parent
                parent ];
            ID = numel(obj.Node);
        end
    end
end