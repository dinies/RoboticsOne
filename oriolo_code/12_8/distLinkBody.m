function dist = distLinkBody(link, body)

nBodies = link.nBodies;
d = zeros(1,nBodies);

for iB = 1:nBodies
        d(iB) = distBodyBody( link{iB}, body );
        if d(iB) == 0.0
            dist = 0;
            return;
        end
end

dist = min (d);

