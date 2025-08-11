export class CreateTripDto {
    riderId: string;
    pickupLocation: string;
    dropOffLocation: string;
    fareEstimate?: number;
}
