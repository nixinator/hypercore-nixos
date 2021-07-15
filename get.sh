#mirror all the nars connected to a nix channel into a hyperdrive and then share it on localhost:8080

hypbinary="/nix/store/w3lkahf5132j8pnj0c5gfyzr2wvzrq7v-node__at_hyperspace_slash_cli-1.5.1/bin/hyp"
hyperurl="hyper://28b4f6d880728d953fed7fa6bd5b61b49bc475a4e0f4d7e50b0bbfcc4e608ef0"

bash -c "$hypbinary drive mkdir $hyperurl/nar "

wget https://channels.nixos.org/nixos-21.05/store-paths.xz
xz -d store-paths.xz


while read -r line
        do GET=`nix path-info --store https://cache.nixos.org --json $line | jq -r .[].url;` 
        echo HI $GET
        OUTPUT=`basename $GET`
        echo BASENAME= $OUTPUT

        wget --directory-prefix=nar/ https://cache.nixos.org/$GET
	cd nar
        echo "RUNNING /nix/store/w3lkahf5132j8pnj0c5gfyzr2wvzrq7v-node__at_hyperspace_slash_cli-1.5.1/bin/hyp drive put $hyperurl/nar < $OUTPUT"
	bash -c $hypbinary drive put $hyperurl/nar/$OUTPUT < $OUTPUT
	cd ..
        echo "RETURNED"
done < "store-paths"
