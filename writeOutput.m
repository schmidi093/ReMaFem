function writeOutput(feObj,u_a,u_b,u_am1,u_ap1)

           u = [reshape(u_a,2,[])';reshape(u_b,2,[])'];
           um1 = [reshape(u_am1,2,[])';reshape(u_bm1,2,[])'];
           up1 = [reshape(u_ap1,2,[])';reshape(u_bp1,2,[])'];
           
           if feObj.control.outputControl.displacement
                feObj.nodeData.displacement = [u(lnIdx',:), zeros(length(u),1)];
           end
           if feObj.control.outputControl.acceleration
                a = (um1-2*u+up1)./(dt^2);
                feObj.nodeData.acceleration = [a(lnIdx',:), zeros(length(a),1)];
           end
           if feObj.control.outputControl.stress
                stress = zeros(length(feObj.e),6);
                for j = 1:length(feObj.e)
                    nIdx = feObj.e(j,:);
                    stress(j,:) = plane3AnalyticalSigma(C,reshape(feObj.nodeData.displacement(nIdx,1:2)',[],1),feObj.n(nIdx,:));
                end
                feObj.elementData.stress = stress;
                if feObj.control.outputControl.vonMisesStress
                    vmStress =  sqrt(stress(:,1).^2+stress(:,2).^2-stress(:,1).*stress(:,2)+3.*stress(:,4).^2);
                    feObj.elementData.vonMisesStress = vmStress;
                end
           end
           if feObj.control.outputControl.force
                f_b = 1/(dt^2)*M_bb*(u_bp1-2*u_b+u_bm1)+ K2(:,1:length(fcN)*2)*u_a + K2(:,(length(fcN)*2+1):end)*u_b;
                f = reshape([f_a;f_b],2,[])';
                feObj.nodeData.force = [f(lnIdx',:), zeros(length(f),1)];               
           end
           if feObj.control.outputControl.velocity
                v = (up1-um1)./(2*dt);
                feObj.nodeData.velocity = [v(lnIdx',:), zeros(length(v),1)];
           end
           if feObj.control.outputControl.meshSkew
                feObj.elementData.meshSkew = meshSkew(feObj,feObj.nodeData.displacement);
           end
           if feObj.control.outputControl.meshAspectRatio
                feObj.elementData.meshAspectRatio = meshAspectRatio(feObj,feObj.nodeData.displacement);
           end
           
           outputWriter.addTimestep(feObj,t,nPlots);
end