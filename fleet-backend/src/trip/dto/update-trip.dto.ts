import { PartialType } from '@nestjs/mapped-types';
import { CreateTripDto } from './create-trip.dto';

export class UpdateTripDto extends PartialType(CreateTripDto) {
    driverId?: string;
    status?: 'requested' | 'accepted' | 'in_progress' | 'completed' | 'cancelled';
}
