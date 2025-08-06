export class CreateTripDto {
    riderId: string;
    pickupLocation: string;
    dropoffLocation: string;
    fareEstimate?: number;
}
