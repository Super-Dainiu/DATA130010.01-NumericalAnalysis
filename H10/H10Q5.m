res=[];
for i=1:13
    res=[res,triang_mesh_recur(@(x,y)exp(sqrt(x))*sin(sqrt(y))/(4*sqrt(x*y)),[0,1],[0,1],0,i)];
end
plot(res);
function [val]=triang_mesh_recur(f,x,y,rev,depth)
    ax=x(1); bx=x(2); ay=y(1); by=y(2);
    if depth==1
        if rev
            val=(bx-ax)*(by-ay)/6*(f(2/3*ax+1/3*bx,1/6*ay+5/6*by)+f(1/6*ax+5/6*bx,2/3*ay+1/3*by)+f(1/6*ax+5/6*bx,1/6*ax+5/6*bx));
%             plot([ax,bx],[by,ay]);
%             hold on
%             plot([ax,bx],[by,by]);
%             hold on
%             plot([bx,bx],[ay,by]);
%             hold on
%             fill([ax,bx,bx],[by,ay,by],'d');
%             hold on
        else
            val=(bx-ax)*(by-ay)/6*(f(2/3*bx+1/3*ax,1/6*by+5/6*ay)+f(1/6*bx+5/6*ax,2/3*by+1/3*ay)+f(1/6*bx+5/6*ax,1/6*bx+5/6*ax));
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