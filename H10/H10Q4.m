res=[];
for i=1:10
    res=[res,triang_mesh_recur(@(x,y)exp(x)*sin(y),[0,1],[0,1],0,i)];
end
plot(res);
hold on
plot(ones(1,numel(res))*(cos(1)/2 + exp(1)/2 - sin(1)/2 - 1));
legend("Results","Exact Value");
function [val]=triang_mesh_recur(f,x,y,rev,depth)
    ax=x(1); bx=x(2); ay=y(1); by=y(2);
    if depth==1
        if rev
            val=(bx-ax)*(by-ay)/6*(f(1/2*(ax+bx),by)+f(bx,1/2*(ay+by))+f(1/2*(ax+bx),1/2*(ay+by)));
%             plot([ax,bx],[by,ay]);
%             hold on
%             plot([ax,bx],[by,by]);
%             hold on
%             plot([bx,bx],[ay,by]);
%             hold on
%             fill([ax,bx,bx],[by,ay,by],'d');
%             hold on
        else
            val=(bx-ax)*(by-ay)/6*(f(1/2*(ax+bx),ay)+f(ay,1/2*(ay+by))+f(1/2*(ax+bx),1/2*(ay+by)));
%             plot([ax,bx],[by,ay]);
%             hold on
%             plot([ax,bx],[ay,ay]);
%             hold on
%             plot([ax,ax],[ay,by]);
%             hold on
        end
    else
        if ~rev
            val=triang_mesh_recur(f,[1/2*(ax+bx),bx],[ay,1/2*(ay+by)],rev,depth-1)...
                +triang_mesh_recur(f,[ax,1/2*(ax+bx)],[ay,1/2*(ay+by)],rev,depth-1)...
                +triang_mesh_recur(f,[ax,1/2*(ax+bx)],[ay,1/2*(ay+by)],~rev,depth-1)...
                +triang_mesh_recur(f,[ax,1/2*(ax+bx)],[1/2*(ay+by),by],rev,depth-1);
        else
            val=triang_mesh_recur(f,[1/2*(ax+bx),bx],[ay,1/2*(ay+by)],rev,depth-1)...
                +triang_mesh_recur(f,[1/2*(ax+bx),bx],[1/2*(ay+by),by],rev,depth-1)...
                +triang_mesh_recur(f,[1/2*(ax+bx),bx],[1/2*(ay+by),by],~rev,depth-1)...
                +triang_mesh_recur(f,[ax,1/2*(ax+bx)],[1/2*(ay+by),by],rev,depth-1);
        end
    end
end
    