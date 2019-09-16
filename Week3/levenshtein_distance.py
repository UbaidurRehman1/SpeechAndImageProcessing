import numpy as np
import sys


def levenshtein_distance(ref, hyp):

    #splitting to array using space regix
    ref_array = ref.split()
    hyp_array = hyp.split()

    #calculating size
    rows = len(ref_array)
    cols = len(hyp_array)

    # Initialize matrix of zeros
    distance = np.zeros((rows,cols),dtype = int)

    # Populate matrix of zeros with the indeces of each character of both strings
    for i in range(1, rows):
        for k in range(1,cols):
            distance[i][0] = i
            distance[0][k] = k

    # Iterate over the matrix to compute the cost of deletions,insertions and/or substitutions    
    for col in range(1, cols):
        for row in range(1, rows):
            if ref_array[row-1] == hyp_array[col-1]:
                cost = 0 # If the characters are the same in the two strings in a given position [i,j] then the cost is 0
            else:
                cost = 1
            distance[row][col] = min(distance[row-1][col] + 1,      # Cost of deletions
                                 distance[row][col-1] + 1,          # Cost of insertions
                                 distance[row-1][col-1] + cost)     # Cost of substitutions
    return distance[row][col]


#this method return the list of deleted words in the hypothesis string
def deletion(ref, hyp):
    ref_array = ref.split()
    hyp_array = hyp.split()

    deleted = []
    for hyp_string in hyp_array:
        if not hyp_string in ref_array:
            deleted.append(hyp_string)
    
    # print("deletion => {}".format(deleted))
    return deleted


#this method return list of inserted words in hypothesis string
def insertion(ref, hyp):
    ref_array = ref.split()
    hyp_array = hyp.split()
    inserted = []
    for ref_string in ref_array:
        if not ref_string in hyp_array:
            inserted.append(ref_string)
    
    # print("inserted => {}".format(inserted))
    return inserted


#removing common words and return tuple of string having no common words
def remove_common_words(ref, hyp):
    common_array = ['the', 'of', 'and', 'a', 'be', 'this', 'there', 'an', 'been', 'some']
    
    ref_array = ref.split()
    hyp_array = hyp.split()

    for ref_string in ref_array:
        if ref_string in common_array:
            ref_array.remove(ref_string)

    for hyp_string in hyp_array:
        if hyp_string in common_array:
            hyp_array.remove(hyp_string)

    return " ".join(ref_array), " ".join(hyp_array)


def main():

    #getting args
    ref_file_path = sys.argv[1]
    hyp_file_path = sys.argv[2]

    #reading files
    ref_file = open(ref_file_path, "r")
    hyp_file = open(hyp_file_path, "r")

    #getting text
    ref = ref_file.read()
    hyp = hyp_file.read()

    #getting distance, list of deleted words, and list of inserted words
    distance = levenshtein_distance(ref, hyp)
    deleted = deletion(ref, hyp)
    inserted = insertion(ref, hyp)

    #writing informations
    first_info = ""
    first_info += "Levenshtein distance is "
    first_info += str(distance) + "\n\r"

    first_info += "Insertion " + str(len(inserted)) + " " + str(inserted) + "\n\r"
    first_info += "Deleteion " + str(len(deleted)) + " " + str(deleted) + "\n\r"

    result_before_removing_common_words = open("result_before_removing_common_words.txt", 'a')
    result_before_removing_common_words.write(first_info)

    print(first_info)
    print("-----------------------After removing common words--------------------------------------")

    #removing common words
    ref, hyp = remove_common_words(ref, hyp)

    #again calculating distances, list of deleted words and list of inserted words
    distance = levenshtein_distance(ref, hyp)
    deleted = deletion(ref, hyp)
    inserted = insertion(ref, hyp)

    #writing informations
    second_info = ""
    second_info += "Levenshtein distance is "
    second_info += str(distance) + "\n\r"
    second_info += "Insertion " + str(len(inserted)) + " " + str(inserted) + "\n\r"
    second_info += "Deleteion " + str(len(deleted)) + " " + str(deleted) + "\n\r"

    result_after_removing_common_words = open("result_after_removing_common_words.txt", 'a')
    result_after_removing_common_words.write(second_info)


    print(second_info)

main()