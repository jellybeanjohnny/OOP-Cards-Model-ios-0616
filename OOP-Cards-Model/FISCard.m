//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Matt Amerige on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard ()

@property (strong, nonatomic, readwrite) NSString *suit;
@property (strong, nonatomic, readwrite) NSString *rank;
@property (strong, nonatomic, readwrite) NSString *cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

- (instancetype)init
{
	return [self initWithSuit:@"!" rank:@"N"];
}

- (instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank
{
	if (!(self = [super init])) {
		return nil;
	}
	
	_suit = suit;
	_rank = rank;
	_cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
	
	_cardValue = [self _cardValueForRank:rank];
	
	return self;
}

+ (NSArray *)validSuits
{
	return @[@"♠", @"♥", @"♣", @"♦"];
}

+ (NSArray *)validRanks
{
	return @[@"A", @"2", @"3", @"4",
					 @"5", @"6", @"7", @"8",
					 @"9", @"10", @"J", @"Q", @"K"];
}

- (NSString *)description
{
	return self.cardLabel;
}

- (NSUInteger)_cardValueForRank:(NSString *)rank
{
	NSUInteger rankIndex = [[FISCard validRanks] indexOfObject:rank];
	if (rankIndex < 10) {
		// add 1 because the array is zero based
		return rankIndex + 1;
	}
	else {
		// always return 10 for a face card (besides ace)
		return 10;
	}
}


@end
