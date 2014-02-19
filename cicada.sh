#!/bin/bash

# temp cleanup section

rm -rf ./000*

function pause(){
   read -p "$*"
}

# main script

echo "Everyone except you is Cicada.
" | pv -qL 40
sleep 2
echo "Would you like to play a game?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo"";break;;
        No ) echo "Very well. Goodbye." | pv -qL 40; exit;;
		
    esac

done

echo "Welcome. Let's begin.
" | pv -qL 40
sleep 1
echo "Creating your recruitment directory...
" | pv -qL 40
mkdir -v 0000-recruitment
echo "
Entering recruitment directory...
" | pv -qL 40
cd 0000-recruitment
sleep 1
echo "On January 5, 2014, a Twitter account associated with Cicada 3301 tweeted a link to an image." | pv -qL 40
sleep 1
echo "The image was black with a the following message in white text:

" | pv -qL 40
sleep 1
echo "=====================================
Hello.

Epiphany is upon you. Your pilgrimage has
begun. Enlightenment awaits.

Good luck.

3301

=====================================
" | pv -qL 40

echo "Would you like to download this image? (Not optional: if you choose 'No', this script will die and our game ends)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo""; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
    
done

echo "Downloading...
" | pv -qL 40
curl -O http://i.imgur.com/zN4h51m.jpg
echo ""
echo "Would you like to view this image? (Optional, but recommended)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) open zN4h51m.jpg; pause 'Press [Enter] key to continue...'; break;;
        No ) break;;
    esac
    
done
echo""
echo "This is image also contains some hidden messages.
" | pv -qL 40
sleep .5
echo "If you adjust the gamma of the image or your monitor, a picture of a cicada will appear.
" | pv -qL 40
sleep 1
echo "Would you like to see it? (Opitonal, but recommended)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) convert zN4h51m.jpg -gamma 10 zN4h51m-gamma-correction.jpg; open zN4h51m-gamma-correction.jpg; pause 'Press [Enter] key to continue...'; break;;
        No ) sleep 1; break;;
    esac
done


echo "
In addition to the cicada, you will see a lot of noise around the white letters.
" | pv -qL 40
sleep 1
echo "This noise is actually another hidden message.
" | pv -qL 40
sleep .5
echo "In order to reaveal this message, it must be extracted from the original image using a tool called outguess.
" | pv -qL 40
sleep 1
echo "Would you like to extract this message? (Not optional: if you choose 'No', this script will die and our game ends)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Extracting to recruitment_message.txt...
" | pv -qL 40;outguess -r zN4h51m.jpg recruitment_message.txt; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

echo "
The message has been extracted. Would you like to read it? (Opitonal, but recommended)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "=====================================
"; cat recruitment_message.txt | pv -qL 200;echo "=====================================
"; sleep 1;break;;
        No ) break;;
    esac
done

echo "
This is a signed GPG message. Would you like to validate it? (Opitonal, but STRONGLY recommended)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "=====================================
"; gpg --verify recruitment_message.txt | pv -qL 40; echo "=====================================
"; sleep 1; break;;
        No ) break;;
    esac
done


echo "
The message contains a book cypher.
" | pv -qL 40
sleep .75
echo "
The first paragraph is a clue to which book was used to create the cypher.
" | pv -qL 40

sleep .5
echo "The text is Ralph Waldo Emerson's 'Self-Reliance and Other Essays'.
" | pv -qL 40

sleep 1

echo "Would you like the text? (Not optional: if you choose 'No', this script will die and our game ends)" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Copying source text into this directory...
" | pv -qL 40 | cp ../assets/0000/self.pdf ./; open self.pdf; break;;
        No )  echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

sleep 1

echo "
To continue, you must use this text to translate the second block of the message.
" | pv -qL 40
sleep .5
echo "
This cypher uses the format:
paragaph:sentence:word:letter" | pv -qL 40
sleep 1

echo -n "
Enter the decoded string and press [Enter]: " | pv -qL 40
read recruitmentstring


if [ $recruitmentstring == 'auqgnxjtvdbll3pv' ]; then
	echo ""
	echo "Congratulations, you have found it." | pv -qL 40
else
	echo "I'm sorry, that is not correct. Goodbye." | pv -qL 40
	exit
fi





echo "
Entering Next Stage: Onion 1" | pv -qL 40
sleep 1
echo "Creating new directory for Onion 1..." | pv -qL 40
cd ..
mkdir -v 0001-auqgnxjtvdbll3pv
echo "
Entering Onion 1 directory..." | pv -qL 40
cd 0001-auqgnxjtvdbll3pv

echo "
In the previous stage, you decoded the book cypher. The string 'auqgnxjtvdbll3pv' represents an onion site that has since gone offline.
" | pv -qL 40
sleep 1
echo "The onion domain featured an image, which is a collage of at least one painting by William Blake.
" | pv -qL 40
sleep 1
echo "Would you like to copy this image?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

echo "
Copying from assets..." | pv -qL 40
cp ../assets/0001/1033.jpg ./
echo "
Would you like to view this image?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) open 1033.jpg; pause 'Press [Enter] key to continue...'; break;;
        No ) break;;
    esac
done

echo "
This image also contains an outguessed message. Would you like to extract it?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Extracting to onion1_message.txt..." | pv -qL 40;outguess -r 1033.jpg onion1_message.txt; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done
echo ""
echo "The message has been extracted. Would you like to read it?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) cat onion1_message.txt | pv -qL 200; break;;
        No ) break;;
    esac
done
sleep 2
echo "

This is a signed GPG message. Would you like to validate it?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) gpg --verify onion1_message.txt | pv -qL 40; break;;
        No ) break;;
    esac
done
echo ""
sleep 2
echo "The message can be seperated into two parts. The first part, spanning the first 3 rows, declares two values, an N and an e. The next part, hugged by 'BEGIN COMPRESSED RSA ENCRYPTED MESSAGE', contains information about an encryption scheme, also called a chiffre, as well as data encoded in base64. Base64 is a scheme to encode unprintable bytes into printable characters." | pv -qL 40

echo "

Would you like to extract the encrypted message?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) cp ../assets/0001/rsa_message ./; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

echo "
Extracted encryped message...
"
sleep 1

echo "Done. Would you like to decrypt the message?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Decrypting message..." | pv -qL 40; perl ../scripts/decrypt-RSA.pl; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

echo "
Decrypting..."
sleep 1
echo "
Done. Would you like to read the message?" | pv -qL 40
select yn in "Yes" "No"; do
    case $yn in
        Yes ) cat decrypted.txt | pv -qL 40; perl ../scripts/decrypt-RSA.pl; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

echo "
Entering Next Stage: Onion 2" | pv -qL 40
sleep 1
echo "Creating new directory for Onion 2..." | pv -qL 40
cd ..
mkdir -v 0002-cu343l33nqaekrnw
echo "
Entering Onion 2 directory..." | pv -qL 40
cd 0002-cu343l33nqaekrnw

echo "
After the successful decryption of the RSA message, we had a single resource:

cu343l33nqaekrnw.onion
This is the address of a Tor Hidden Service. Upon visiting the service, the following document was displayed:


<!--Patience is a virtue-->
634292ba49fe336edada779a34054a335c2ec12c8bbaed4b92dcc05efe98f76abffdc2389bdb9de2cf20c009acdc1945ab095a52609a5c219afd5f3b3edf10fcb25950666dfe8d8c433cd10c0b4c72efdfe12c6270d5cfde291f9cf0d73cb1211140136e4057380c963d70c76948d9cf6775960cf98fbafa435c44015c5959837a0f8d9f46e094f27c5797b7f8ab49bf28fa674d2ad2f726e197839956921dab29724cd48e1a81fc9bab3565f7513e3e368cd0327b47cf595afebb78d6b5bca92ba021cd6734f4362a0b341f359157173b53d49ea5dff5889d2c9de6b0d7e8c615286ce596bfa83f50b6eeabd153aaf50cd75f39929ba11fb0f8e8d611442846

The page appeared to be static. However, after some time, we noticed that the string was slowly growing. Every few minutes, two characters were appended to the end of the string. This process continued for approximately 23 hours. The time intervals between new bytes were found to be multiples of five. Various users recorded the minutes between updates, the time that they occurred, and the data appended at those times. 

After 23 hours, the process stopped and no more characters/bytes were appended to the string. The final string was:

634292ba49fe336edada779a34054a335c2ec12c8bbaed4b92dcc05efe98f76abffdc2389bdb9de2cf20c009acdc1945ab095a52609a5c219afd5f3b3edf10fcb25950666dfe8d8c433cd10c0b4c72efdfe12c6270d5cfde291f9cf0d73cb1211140136e4057380c963d70c76948d9cf6775960cf98fbafa435c44015c5959837a0f8d9f46e094f27c5797b7f8ab49bf28fa674d2ad2f726e197839956921dab29724cd48e1a81fc9bab3565f7513e3e368cd0327b47cf595afebb78d6b5bca92ba021cd6734f4362a0b341f359157173b53d49ea5dff5889d2c9de6b0d7e8c615286ce596bfa83f50b6eeabd153aaf50cd75f39929ba11fb0f8e8d611442846

This string is 512 characters long. We assume it is hexadecimal.

" | pv -qL 200
sleep 2

echo "However, about an hour after the string finished growing, at approximately 05:31:40 GMT the document changed. The old 512-character code was gone, along with the HTML comment. In its place was a large document.
" | pv -qL 40

sleep 1

echo "Would you like to copy this file from the assets directory?" | pv -qL 40


select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

echo "Copying..." | pv -qL 40
cp ../assets/0002/onion2-full.hex ./

echo "
The new string was 3641299 (?) characters long. We noticed that it contained a significant amount of repeated text.

Analsysis of this new string revealed that it contained three JPEG image files. This was discovered when we:

1. Converted the string into its binary representation
2. Flipped all the bits (i.e. 0 becomes 1, 1 becomes 0) [Note: this is equivalent to XOR 111111] " | pv -qL 40

sleep 1
echo "
Would you like to convert and XOR the hex string?" | pv -qL 40

select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Converting..." | pv -qL 40; python ../scripts/xor.py; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done
 

echo "Done.

onion2invert.bin
and
onioninvert2-rev.bin have been created

Looking at that XOR'd binary string, we noticed that the first two bytes were

0xFF 0xD8

Wikipedia tells us that these are the first two bytes of a JPEG image. We walked through the data left to right, and later on in the string, we discovered the same byte sequence again. This indicated the presence of more than one JPEG image. We analysed the rest of the string in a similar fashion, and discovered a total of three JPEG images. The third JPEG image was in reverse order, and so had to be un-reversed.

For further clarification, the order was this (.... = JPEG data, [ ] = one complete image):

[0xFF 0xD8........................][0xFF 0xD8........................][........................0xD8 0xFF]

Would you like to generate these three images now?" | pv -qL 40

select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Generating image 1...
" | pv -qL 40; dd if=onion2invert.bin of=onion2-1.jpg bs=1 skip=0 count=168876; echo "Generating image 2...
" | pv -qL 40; dd if=onion2invert.bin of=onion2-2.jpg bs=1 skip=168876 count=1476614; echo "Generating image 3...
" | pv -qL 40; dd if=onion2invert-rev.bin of=onion2-3.jpg bs=1 skip=0 count=175159; break;;
        No ) echo "Your journey ends here. Goodbye." | pv -qL 40; exit;;
    esac
done

sleep 1
echo ""
echo "Images created. Would you like to see them?" | pv -qL 40
select yn in "Yes" "No"; do
	case $yn in
		Yes ) open onion2-1.jpg; open onion2-2.jpg; open onion2-3.jpg; break;;
		No ) break;;
	esac
done
sleep 1
echo "
Each of these new images also contain outguessed data. Would you like to extract?" | pv -qL 40

select yn in "Yes" "No"; do
	case $yn in
		Yes ) outguess -r onion2-1.jpg onion2-1-outguess.txt; outguess -r onion2-2.jpg onion2-2-outguess.txt; outguess -r onion2-3.jpg onion2-3-outguess.txt; break;;
		No ) exit;;
	esac
done

cat onion2-1-outguess.txt
cat onion2-2-outguess.txt
cat onion2-3-outguess.txt




echo "" | pv -qL 40
echo "" | pv -qL 40
echo "" | pv -qL 40
echo "" | pv -qL 40
echo "" | pv -qL 40
echo "" | pv -qL 40
echo "" | pv -qL 40




